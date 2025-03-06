#!/bin/bash
# for i in {100,1000,1100,1200,125,1300,1400,150,1600,170,1800,190,2000,2200,2400,250,2500,2600,2800,300,350,400,450,500,550,60,600,650,70,700,80,800,900}
# for i in {800,700}
# do
    folder='/eos/user/z/zhjie/ForJieZhang/cut/signal/flashgg_boost'
    for file in $folder/*.root
    do
        python trees2ws.py --inputConfig config_simple.py --inputTreeFile $file --inputMass 125 --productionMode gghh --year 2017  
    done
done/