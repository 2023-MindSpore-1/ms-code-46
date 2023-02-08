
if [ $# != 2 ]
then
    echo "=============================================================================================================="
    echo "Usage: bash PSPNet/scripts/run_train1p_ascend.sh [YAML_PATH] [DEVICE_ID]"
    echo "for example: bash PSPNet/scripts/run_train1p_ascend.sh PSPNet/config/voc2012_pspnet50.yaml 0"
    echo "=============================================================================================================="
    exit 1
fi

rm -rf LOG
mkdir ./LOG
export YAML_PATH=$1
export RANK_SIZE=1
export RANK_ID=0
export DEVICE_ID=$2
echo "start training for device $DEVICE_ID"
env > env.log

python3 train.py --config="$YAML_PATH" > ./LOG/log.txt 2>&1 &
