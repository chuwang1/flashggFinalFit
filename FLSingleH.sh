#!/usr/bin/env bash
eval `scramv1 runtime -sh`
source ./setup.sh
############################################
SingleHiggs=("tth" "wzh" "vbf" "ggh")
years=("2018" "2016" "2017")
for year in ${years[@]}
do
  if [ $year -eq "2017" ]
  then
    Names=("ttHJetToGG" "VHToGG" "VBFHToGG" "GluGluHToGG")
  else
    Names=("ttHJetToGG_M125" "VHToGG_M125" "VBFHToGG_M125" "GluGluHToGG_M125")
  fi
  for (( i = 0 ; i < 4 ; i++ ))
  do
    Name=${Names[$i]}
    procs=${SingleHiggs[$i]}
    ext='FL_pt100'
    cat='HHWWggTag_FL_0' #output cat name, it will be used in subsequence step
    InputTreeCats='HHWWggTag_2' #input cat name in the tree
    catNames=(${cat//,/ })
    mass='125'
    if [ $year -eq "2017" ]
    then
      TreePath="/eos/user/a/atishelm/ntuples/HHWWgg_flashgg/January_2021_Production/2017/Single_H_2017_Hadded/"
    elif [ $year -eq "2016" ]
    then
      TreePath="/eos/user/a/atishelm/ntuples/HHWWgg_flashgg/January_2021_Production/2016/Single_H_hadded/"
    else
      TreePath="/eos/user/a/atishelm/ntuples/HHWWgg_flashgg/January_2021_Production/2018/Single_H_2018_hadded/"
    fi
    InputWorkspace="/eos/user/c/chuw/HHWWggWorkspace/FL_withPt_over_Mass_dipho_pt100/" #where you place output workspace
    doSelections="1"
    Selections='((Leading_Photon_pt/CMS_hgg_mass) > 1/3. \&\& (Subleading_Photon_pt/CMS_hgg_mass) > 1/4. ) \&\& dipho_pt > 100' # Seletions you want to applied.
    Replace="tth"
    ############################################
    #  Tree selectors#
    #
    ############################################
    cp ./Signal/tools/replacementMapHHWWgg.py ./Signal/tools/replacementMap.py
    sed -i "s#REPLACEMENT#${Replace}#g" ./Signal/tools/replacementMap.py
    path=`pwd`
    cd ./Reweight/
    echo $Name $procs
    cp SingleHiggsSelections.C SingleHiggsSelections_Run.C
    sed -i "s#NEW_Cat_NAME#${cat}#g" SingleHiggsSelections_Run.C 
    sed -i "s#NAME#${Name}#g" SingleHiggsSelections_Run.C 
    sed -i "s#CAT#${InputTreeCats}#g" SingleHiggsSelections_Run.C
    sed -i "s#PROCS#${procs}#g" SingleHiggsSelections_Run.C
    sed -i "s#YEAR#${year}#g" SingleHiggsSelections_Run.C
    sed -i "s#2017#${year}#g" SingleHiggsSelections_Run.C
    sed -i "s#INPUTPATH#${TreePath}#g" SingleHiggsSelections_Run.C
    if [ "$ext" = "SL" ]
    then
      sed -i "s#tagsDumper/trees/##g" SingleHiggsSelections_Run.C
    fi
    if [ $doSelections -eq "1" ]
    then
      echo "Selection start"
      sed -i "s#SELECTIONS#${Selections}#g" SingleHiggsSelections_Run.C
    else
      echo "Do not apply any selections ,just copytree "
      sed -i "s#SELECTIONS##g" SingleHiggsSelections_Run.C # No Selection 
    fi
    if [ $year -eq "2018" ]
    then
      sed -i "s#metUncUncertainty\"#metUncUncertainty\",\"JetHEM\"#g" SingleHiggsSelections_Run.C
    fi
    # root -b -q SingleHiggsSelections_Run.C
    mv ${Name}_${year}.root  ../Trees2WS/
    cd ../Trees2WS/

#########################################
# start tree to workspace
########################################

if [ ! -d "$InputWorkspace/Signal/Input/${year}/" ]; then
  mkdir -p $InputWorkspace/Signal/Input/${year}
fi
# Signal tree to data ws
if [ $year -eq "2018" ]
then
  echo " 2018, remove prefire"
  cp HHWWgg_config_noprefire.py HHWWgg_config_run.py
else
  cp HHWWgg_config.py HHWWgg_config_run.py
fi
sed -i "s#2017#${year}#g" HHWWgg_config_run.py
sed -i "s#auto#${cat}#g" HHWWgg_config_run.py
rm -rf ws*
# python trees2ws.py --inputConfig HHWWgg_config_run.py --inputTreeFile ./${Name}_${year}.root --inputMass ${mass} --productionMode ${procs}  --year ${year} --doSystematics
rm HHWWgg_config_run.py
for catName in ${catNames[@]}
do
  cp ws_${procs}/${Name}_${year}_${procs}.root $InputWorkspace/Signal/Input/${year}/Shifted_M125_${procs}_${catName}.root
  cp ws_${procs}/${Name}_${year}_${procs}.root $InputWorkspace/Signal/Input/${year}/output_M125_${procs}_${catName}.root
done
rm ${Name}_${year}.root
#######################################
# Run ftest
######################################
cd ../Signal
echo "Run FTest"
cp HHWWgg_single_higgs.py HHWWgg_config_Run.py
sed -i "s#NODE#node_${node}#g" HHWWgg_config_Run.py
sed -i "s#YEAR#${year}#g" HHWWgg_config_Run.py
sed -i "s#PROCS#${procs}#g" HHWWgg_config_Run.py
sed -i "s#HHWWggTest#${ext}#g" HHWWgg_config_Run.py
sed -i "s#CAT#${cat}#g" HHWWgg_config_Run.py
sed -i "s#INPUTDIR#${InputWorkspace}/Signal/Input/${year}/#g" HHWWgg_config_Run.py
python RunSignalScripts.py --inputConfig HHWWgg_config_Run.py --mode fTest --modeOpts "doPlots"

#######################################
# Run photon sys
######################################
python RunSignalScripts.py --inputConfig HHWWgg_config_Run.py --mode calcPhotonSyst


#######################################
#Run signal Fit
#######################################
python RunSignalScripts.py --inputConfig HHWWgg_config_Run.py --mode signalFit --groupSignalFitJobsByCat
for catName in ${catNames[@]}
do
  mkdir outdir_${ext}_${procs}_${year}_single_Higgs/
  cp ${path}/Signal/outdir_${ext}_${year}_single_Higgs/signalFit/output/CMS-HGG_sigfit_${ext}_${year}_single_Higgs_${procs}_${year}_${catName}.root outdir_${ext}_${procs}_${year}_single_Higgs/CMS-HGG_sigfit_${ext}_${procs}_${year}_single_Higgs_${catName}.root
  python RunPlotter.py --procs all --years $year --cats $catName --ext ${ext}_${procs}_${year}_single_Higgs --HHWWggLabel ${ext}_${procs}
done



rm HHWWgg_config_Run.py


########################################
#           DATACARD                   #
#                                      #
########################################
echo "Start generate datacard(no systeamtics)"
cd ../Datacard
if [ ! -d "./SingleHiggs_${ext}_${year}" ]; then
  mkdir -p ./SingleHiggs_${ext}_${year}/
fi
rm Datacard*.txt
rm -rf yields_test/
#copy signal modl
for catName in ${catNames[@]}
do
  cp ${path}/Signal/outdir_${ext}_${year}_single_Higgs/signalFit/output/CMS-HGG_sigfit_${ext}_${year}_single_Higgs_${procs}_${year}_${catName}.root ./SingleHiggs_${ext}_${year}/CMS-HGG_sigfit_packaged_${procs}_${catName}_${year}.root 
done
cd ${path}
done
done
