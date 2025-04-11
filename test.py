import ROOT
from ROOT import RooRealVar, RooDoubleCBFast, RooFit
ROOT.gROOT.SetBatch(1)
x = RooRealVar("x", "x", -10, 800)

mean = RooRealVar("mean", "mean of gaussians", 0, -10, 800)
sigma = RooRealVar("sigma", "width of gaussians", 1, 0.1, 30)
alpha1 = RooRealVar("alpha1", "alpha of the left tail", 1, -10, 10)
n1 = RooRealVar("n1", "n of the left tail", 2, 0.1, 10)
alpha2 = RooRealVar("alpha2", "alpha of the right tail", 1, 0.1, 10)
n2 = RooRealVar("n2", "n of the right tail", 2, 0.1, 10)

doubleCrystalBallFast = RooDoubleCBFast("doubleCrystalBallFast", "Double Crystal Ball Fast",
                                        x, mean, sigma, alpha1, n1, alpha2, n2)

frame = x.frame(RooFit.Title("Double Crystal Ball Fast"))
# doubleCrystalBallFast.plotOn(frame)

c1 = ROOT.TCanvas("c1", "Double Crystal Ball Fast", 800, 600)

mean.setVal(0)
alpha1.setVal(0.1)
alpha2.setVal(1)
mean.setVal(350)
n1.setVal(50)
n2.setVal(50)
sigma.setVal(30)
# n1.setVal(5)

doubleCrystalBallFast.plotOn(frame,ROOT.RooFit.LineColor(ROOT.kRed))
frame.Draw()
c1.SaveAs("double_crystal_ball_fast.png")