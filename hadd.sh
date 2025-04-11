    rm /eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_$2/opt/$3/root/addsys/output_NMSSM_XToYHTo2B2G_MX-"$2"_MY-"$1"_cat*_"$3"_M125_pythia8_gghh.root

    cats=()
    for file in /eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_$2/opt/$3/signal_$1*.parquet
    do
        cat=${file%.*}
        cat=${cat##*'_'}
        cats+=($cat)
    done
    for cat in "${cats[@]}"
    do
        echo $cat
        allroot=""
        for file in /eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_$2/opt/$3/root/*.root
        do
            if [[ ($file == *MY-"$1"_* && $file == *$cat*) || ($file == *signal_"$1"_$cat*) ]]; then
                allroot="${allroot} ${file}"
            fi 
        done
        echo $allroot
        hadd -f /eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_$2/opt/$3/root/addsys/output_NMSSM_XToYHTo2B2G_MX-"$2"_MY-"$1"_"$cat"_"$3"_M125_pythia8_gghh.root $allroot
    done




    