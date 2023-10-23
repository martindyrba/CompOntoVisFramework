#!/bin/bash

#docker pull deepmi/fastsurfer:gpu-v2.0.4
# !!! parameter --segstats was removed in v2.1.x, also corpus callosum (CC)
# segmentations are missing in that versions' aseg+DKT.stats file

cd /mnt/ssd1/dyrba/

mkdir -p NIFD_FastSurfer/logs
mkdir -p NIFD_FastSurfer/output

# define max number of parallel subjects to process
max_parallel=4;

for i in NIFD_original/*.nii*; do 
  infile=${i##*/};
  ptid=${infile#sub-};
  ptid=${ptid%_ses-M00_T1w*};
  echo "processing $ptid";

    docker run --gpus all \
      -v $(pwd)/NIFD_original:/data \
      -v $(pwd)/NIFD_FastSurfer/output:/output \
      -v ${FREESURFER_HOME}:/fs60 \
      --rm --user $(id -u):$(id -g) \
      deepmi/fastsurfer:gpu-v2.0.4 \
      --t1 /data/"$infile" \
      --sid "$ptid" \
      --sd /output > $(pwd)/NIFD_FastSurfer/logs/out-"${ptid}".log \
      --fs_license /fs60/license.txt \
      --parallel --threads 10 --seg_only --vol_segstats &

    # warte 120 Sekunden bis zum Aufruf des nächsten Probanden oder warte länger, wenn Anzahl max_parallel schon laufen
    sleep 120

    while [ $(jobs | wc -l) -ge $max_parallel ]; do
      sleep 30  # wait for 30 seconds, and recheck if more than max_parallel jobs already started in background
    done 
done

cd NIFD_FastSurfer/

grep -H "(eTIV)" output/*/scripts/recon-surf.log > etiv.txt

# create table header
#echo '"index", "segId", "nVoxels", "volume_mm3", "structName", "normMean", "normStdDev", "normMin", "normMax", "normRange"'> FastSurfer-Volumes-NIFD.csv
echo -n "SID  " > FastSurfer-Volumes-NIFD.csv
tail -n 100 output/NIFD1S0001/stats/aparc.DKTatlas+aseg.deep.volume.stats | sed -E "s/^ +//g;s/ +/\t/g" | cut -f 5 | rs 1 >> FastSurfer-Volumes-NIFD.csv
# collect data
for i in output/NIFD*/stats/aparc.DKTatlas+aseg.deep.volume.stats; do
  sid=${i#output/}
  sid=${sid%%/*}
  echo -n "$sid  ";
  tail -n 100 $i | sed -E "s/^ +//g;s/ +/\t/g" | cut -f 4 | rs 1
done >> FastSurfer-Volumes-NIFD.csv
sed -i -E "s/ +/\t/g" FastSurfer-Volumes-NIFD.csv


# convert mgz to nii.gz format

for j in $(find output -type f -name aparc.DKTatlas+aseg.deep.withCC.mgz); do
  echo converting $j;
  mri_convert -i $j -o ${j/.mgz/.nii.gz};
  # sample call: mri_convert.bin -i EDSD_FastSurfer/output/ROS_HC019/mri/aparc.DKTatlas+aseg.deep.withCC.mgz -o EDSD_FastSurfer/output/ROS_HC019/mri/aparc.DKTatlas+aseg.deep.withCC.nii.gz
done

