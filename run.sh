sh run_signal_model.sh $2 $1 2016pre
sh run_signal_model.sh $2 $1 2016post
sh run_signal_model.sh $2 $1 2017
sh run_signal_model.sh $2 $1 2018
sh run_boost.sh $2 $1 
sh run_background_datacard.sh $2 $1
