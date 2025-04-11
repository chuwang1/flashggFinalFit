localWorkDir=$PWD
cd ${localWorkDir}/Signal
for file in  allsys/"$3"_"$2"/config_ttH_dijet_"$2"*_$1_*cat*.py
do
       
        cat=${file##*'_'}
        
        cat=${cat%'.'*}

        y=${file%'_'$cat'.'*}
        y=${y##*'_'}

        python3 RunSignalScripts.py --inputConfig $file --mode 'signalFit' --modeOpts '--useDCB --xvar Dijet_mass --mass '$y' --MHLow 0 --MHHigh 1000  --doPlots --skipVertexScenarioSplit --nBins 25 --skipSystematics'  
done