import QtQuick		2.12
import JASP.Module	1.0

Upgrades
{
	Upgrade
	{
		functionName: 		"SEMSimple"
		newFunctionName:	"SEM"
		fromVersion:		"0.14.3"
		toVersion:			"0.15"

		ChangeJS
		{
			name:		"factorStandardisation"
			jsFunction:	function(options)
			{
				switch(options["factorStandardisation"])
				{
					case "factorLoadings":		return "auto.fix.first";
					case "residualVariance":	return "std.lv";
					default:					return options["factorStandardisation"]
				}
			}
		}

		ChangeSetValue
		{
			name:		"estimator"
			condition:	function(options) { return options["estimator"] === "automatic"; }
			jsonValue:	"default"
		}

		ChangeSetValue
		{
			name:		"emulation"
			condition:	function(options) { return options["emulation"] === "none"; }
			jsonValue:	"lavaan"
		}

		ChangeRename { from: "model"; to: "models" }

		ChangeJS
		{
			name:		"models"
			jsFunction:	function(options)
			{
				return [
							{
								modelName:	"Model 1",
								syntax:
								{
									modelOriginal:	options["models"]
								}
							}

						];
			}
		}
	}

	Upgrade
	{
		functionName: "LatentGrowthCurve";	fromVersion: "0.15";	toVersion: "0.16";

		ChangeRename
		{
			from:	"covar"
			to:		"covaryingLatentCurve"
		}

		ChangeRename
		{
			from:	"outputAdditionalFitMeasures"
			to:		"additionalFitMeasures"
		}

		ChangeRename
		{
			from:	"rsquared"
			to:		"rSquared"
		}

		ChangeRename
		{
			from:	"std"
			to:		"standardizedEstimate"
		}

		ChangeRename
		{
			from:	"impliedCov"
			to:		"impliedCovarianceMatrix"
		}

		ChangeRename
		{
			from:	"residCov"
			to:		"residualCovarianceMatrix"
		}

		ChangeRename
		{
			from:	"showSyntax"
			to:		"syntax"
		}

		ChangeRename
		{
			from:	"curveplot"
			to:		"curvePlot"
		}

		ChangeRename
		{
			from:	"plot_categorical"
			to:		"curvePlotCategorical"
		}

		ChangeRename
		{
			from:	"plot_max_n"
			to:		"curvePlotMaxLines"
		}

		ChangeRename
		{
			from:	"misfitplot"
			to:		"misfitPlot"
		}

		ChangeRename
		{
			from:	"pathplot"
			to:		"pathPlot"
		}

		ChangeRename
		{
			from:	"plotpars"
			to:		"pathPlotParameter"
		}

		ChangeRename
		{
			from:	"plotmeans"
			to:		"pathPlotMean"
		}

		ChangeRename
		{
			from:	"mimic"
			to:		"emulation"
		}

		ChangeJS
		{
			name:		"emulation"
			jsFunction:	function(options)
			{
				switch(options["emulation"])
				{
					case "Mplus":	return "mplus";
					case "EQS":	return "eqs";
				}
			}
		}

		ChangeRename
		{
			from:	"missing"
			to:		"naAction"
		}

		ChangeRename
		{
			from:	"ciWidth"
			to:		"ciLevel"
		}

		ChangeRename
		{
			from:	"se"
			to:		"samplingMethod"
		}

		ChangeRename
		{
			from:	"bootstrapNumber"
			to:		"bootstrapSamples"
		}

		ChangeJS
		{
			name:		"estimator"
			jsFunction:	function(options)
			{
				switch(options["estimator"])
				{
					case "ML":		return "ml";
					case "GLS":		return "gls";
					case "WLS":		return "wls";
					case "ULS":		return "uls";
					case "DWLS":	return "dwls";
				}
			}
		}

		ChangeRename
		{
			from:	"fixManifestInterceptsToZero"
			to:		"manifestInterceptZeroFix"
		}

		ChangeRename
		{
			from:	"fixLatentInterceptsToZero"
			to:		"latentInterceptZeroFix"
		}

		ChangeRename
		{
			from:	"omitResidualSingleIndicator"
			to:		"residualSingleIndicatorOmission"
		}

		ChangeRename
		{
			from:	"residualVariances"
			to:		"residualVariance"
		}

		ChangeRename
		{
			from:	"correlateExogenousLatents"
			to:		"exogenousLatentCorrelation"
		}

		ChangeRename
		{
			from:	"addThresholds"
			to:		"threshold"
		}

		ChangeRename
		{
			from:	"addScalingParameters"
			to:		"scalingParameter"
		}

		ChangeRename
		{
			from:	"correlateDependentVariables"
			to:		"dependentCorrelation"
		}

		ChangeRename
		{
			from:	"groupvar"
			to:		"group"
		}
	}

	Upgrade
	{
		functionName: "MediationAnalysis";	fromVersion: "0.15";	toVersion: "0.16";

		ChangeRename
		{
			from:	"predictor"
			to:		"predictors"
		}

		ChangeRename
		{
			from:	"dependent"
			to:		"dependents"
		}

		ChangeRename
		{
			from:	"std"
			to:		"standardizedEstimate"
		}

		ChangeRename
		{
			from:	"showSyntax"
			to:		"syntax"
		}

		ChangeRename
		{
			from:	"rsquared"
			to:		"rSquared"
		}

		ChangeRename
		{
			from:	"showtotind"
			to:		"totalIndirectEffect"
		}

		ChangeRename
		{
			from:	"showres"
			to:		"residualCovariance"
		}

		ChangeRename
		{
			from:	"showPathCoefficients"
			to:		"pathCoefficient"
		}

		ChangeRename
		{
			from:	"ciWidth"
			to:		"ciLevel"
		}

		ChangeRename
		{
			from:	"se"
			to:		"samplingMethod"
		}

		ChangeRename
		{
			from:	"bootstrapNumber"
			to:		"bootstrapSamples"
		}

		ChangeRename
		{
			from:	"bootCItype"
			to:		"bootstrapCiType"
		}

		ChangeJS
		{
			name:		"bootstrapCiType"
			jsFunction:	function(options)
			{
				switch(options["bootstrapCiType"])
				{
					case "bca.simple":	return "percentileBiasCorrected";
					case "perc":		return "percentile";
					case "norm":		return "normalTheory";
				}
			}
		}

		ChangeRename
		{
			from:	"pathplot"
			to:		"pathPlot"
		}

		ChangeRename
		{
			from:	"plotpars"
			to:		"pathPlotParameter"
		}

		ChangeRename
		{
			from:	"plotlegend"
			to:		"pathPlotLegend"
		}

		ChangeRename
		{
			from:	"missing"
			to:		"naAction"
		}

		ChangeRename
		{
			from:	"mimic"
			to:		"emulation"
		}

		ChangeJS
		{
			name:		"emulation"
			jsFunction:	function(options)
			{
				switch(options["emulation"])
				{
					case "Mplus":	return "mplus";
					case "EQS":	return "eqs";
				}
			}
		}

		ChangeJS
		{
			name:		"estimator"
			jsFunction:	function(options)
			{
				switch(options["estimator"])
				{
					case "ML":		return "ml";
					case "GLS":		return "gls";
					case "WLS":		return "wls";
					case "ULS":		return "uls";
					case "DWLS":	return "dwls";
				}
			}
		}
	}

	Upgrade
	{
		functionName: "MIMIC";	fromVersion: "0.15";	toVersion: "0.16";

		ChangeRename
		{
			from:	"std"
			to:		"standardizedEstimate"
		}

		ChangeRename
		{
			from:	"showSyntax"
			to:		"syntax"
		}

		ChangeRename
		{
			from:	"rsquared"
			to:		"rSquared"
		}

		ChangeRename
		{
			from:	"additionalfits"
			to:		"additionalFitMeasures"
		}

		ChangeRename
		{
			from:	"ciWidth"
			to:		"ciLevel"
		}

		ChangeRename
		{
			from:	"se"
			to:		"samplingMethod"
		}

		ChangeRename
		{
			from:	"bootstrapNumber"
			to:		"bootstrapSamples"
		}

		ChangeRename
		{
			from:	"bootCItype"
			to:		"bootstrapCiType"
		}

		ChangeJS
		{
			name:		"bootstrapCiType"
			jsFunction:	function(options)
			{
				switch(options["bootstrapCiType"])
				{
					case "bca.simple":	return "percentileBiasCorrected";
					case "perc":		return "percentile";
					case "norm":		return "normalTheory";
				}
			}
		}

		ChangeRename
		{
			from:	"pathplot"
			to:		"pathPlot"
		}

		ChangeRename
		{
			from:	"plotpars"
			to:		"pathPlotParameter"
		}

		ChangeRename
		{
			from:	"plotlegend"
			to:		"pathPlotLegend"
		}

		ChangeRename
		{
			from:	"missing"
			to:		"naAction"
		}

		ChangeRename
		{
			from:	"mimic"
			to:		"emulation"
		}

		ChangeJS
		{
			name:		"emulation"
			jsFunction:	function(options)
			{
				switch(options["emulation"])
				{
					case "Mplus":	return "mplus";
					case "EQS":	return "eqs";
				}
			}
		}

		ChangeJS
		{
			name:		"estimator"
			jsFunction:	function(options)
			{
				switch(options["estimator"])
				{
					case "ML":		return "ml";
					case "GLS":		return "gls";
					case "WLS":		return "wls";
					case "ULS":		return "uls";
					case "DWLS":	return "dwls";
				}
			}
		}
	}

	Upgrade
	{
		functionName: "SEM";	fromVersion: "0.15";	toVersion: "0.16";

		ChangeRename
		{
			from:	"Data"
			to:		"dataType"
		}

		ChangeRename
		{
			from:	"varcov"
			to:		"varianceCovariance"
		}

		ChangeRename
		{
			from:	"SampleSize"
			to:		"sampleSize"
		}

		ChangeRename
		{
			from:	"sampling.weights"
			to:		"samplingWeights"
		}

		ChangeRename
		{
			from:	"outputAdditionalFitMeasures"
			to:		"additionalFitMeasures"
		}

		ChangeRename
		{
			from:	"outputRSquared"
			to:		"rSquared"
		}

		ChangeRename
		{
			from:	"outputObservedCovariances"
			to:		"observedCovariance"
		}

		ChangeRename
		{
			from:	"outputImpliedCovariances"
			to:		"impliedCovariance"
		}

		ChangeRename
		{
			from:	"outputResidualCovariances"
			to:		"residualCovariance"
		}

		ChangeRename
		{
			from:	"outputStandardizedResiduals"
			to:		"standardizedResidual"
		}

		ChangeRename
		{
			from:	"outputMardiasCoefficients"
			to:		"mardiasCoefficient"
		}

		ChangeRename
		{
			from:	"std"
			to:		"standardizedEstimate"
		}
		 
		ChangeRename
		{
			from:	"outputPathPlot"
			to:		"pathPlot"
		}

		ChangeRename
		{
			from:	"pathPlotPar"
			to:		"pathPlotParameter"
		}

		ChangeRename
		{
			from:	"outputModificationIndices"
			to:		"modificationIndex"
		}

		ChangeRename
		{
			from:	"miHideLow"
			to:		"modificationIndexHiddenLow"
		}

		ChangeRename
		{
			from:	"miThreshold"
			to:		"modificationIndexThreshold"
		}

		ChangeRename
		{
			from:	"factorStandardisation"
			to:		"factorScaling"
		}

		ChangeJS
		{
			name:		"factorScaling"
			jsFunction:	function(options)
			{
				switch(options["factorScaling"])
				{
					case "auto.fix.first":	return "factorLoading";
					case "std.lv":			return "factorVariance";
					case "effect.coding":	return "effectCoding";
				}
			}
		}

		ChangeRename
		{
			from:	"int.ov.fixed"
			to:		"manifestInterceptZeroFix"
		}

		ChangeRename
		{
			from:	"int.lv.fixed"
			to:		"latentInterceptZeroFix"
		}

		ChangeRename
		{
			from:	"fixed.x"
			to:		"exogenousCovariateFix"
		}

		ChangeRename
		{
			from:	"auto.fix.single"
			to:		"residualSingleIndicatorOmission"
		}

		ChangeRename
		{
			from:	"auto.var"
			to:		"residualVariance"
		}

		ChangeRename
		{
			from:	"auto.cov.lv.x"
			to:		"exogenousLatentCorrelation"
		}

		ChangeRename
		{
			from:	"auto.cov.y"
			to:		"dependentCorrelation"
		}

		ChangeRename
		{
			from:	"auto.th"
			to:		"threshold"
		}

		ChangeRename
		{
			from:	"auto.delta"
			to:		"scalingParameter"
		}

		ChangeRename
		{
			from:	"auto.efa"
			to:		"efaConstrained"
		}

		ChangeRename
		{
			from:	"information"
			to:		"informationMatrix"
		}

		ChangeRename
		{
			from:	"se"
			to:		"samplingMethod"
		}

		ChangeRename
		{
			from:	"bootstrapNumber"
			to:		"bootstrapSamples"
		}

		ChangeRename
		{
			from:	"bootCItype"
			to:		"bootstrapCiType"
		}

		ChangeJS
		{
			name:		"bootstrapCiType"
			jsFunction:	function(options)
			{
				switch(options["bootstrapCiType"])
				{
					case "bca.simple":	return "percentileBiasCorrected";
					case "perc":		return "percentile";
					case "norm":		return "normalTheory";
				}
			}
		}

		ChangeRename
		{
			from:	"ciWidth"
			to:		"ciLevel"
		}

		ChangeRename
		{
			from:	"std.ov"
			to:		"standardizedVariable"
		}

		ChangeJS
		{
			name:		"estimator"
			jsFunction:	function(options)
			{
				switch(options["estimator"])
				{
					case "ML":		return "ml";
					case "GLS":		return "gls";
					case "WLS":		return "wls";
					case "ULS":		return "uls";
					case "DWLS":	return "dwls";
					case "PML":		return "pml";
				}
			}
		}

		ChangeRename
		{
			from:	"test"
			to:		"modelTest"
		}

		ChangeJS
		{
			name:		"modelTest"
			jsFunction:	function(options)
			{
				switch(options["modelTest"])
				{
					case "Satorra.Bentler":		return "satorraBentler";
					case "Yuan.Bentler":		return "yuanBentler";
					case "mean.var.adjusted":	return "meanAndVarianceAdjusted";
					case "scaled.shifted":		return "scaledAndShifted";
					case "Bollen.Stine":		return "bollenStine";
				}
			}
		}

		ChangeRename
		{
			from:	"missing"
			to:		"naAction"
		}

		ChangeJS
		{
			name:		"naAction"
			jsFunction:	function(options)
			{
				switch(options["naAction"])
				{
					case "ml":					return "fiml";
					case "two.stage":			return "twoStage";
					case "robust.two.stage":	return "twoStageRobust";
					case "doubly.robust":		return "doublyRobust";
				}
			}
		}

		ChangeJS
		{
			name:		"emulation"
			jsFunction:	function(options)
			{
				switch(options["emulation"])
				{
					case "Mplus":	return "mplus";
					case "EQS":	return "eqs";
				}
			}
		}

		ChangeRename
		{
			from:	"groupingVariable"
			to:		"group"
		}

		ChangeRename
		{
			from:	"eq_loadings"
			to:		"equalLoading"
		}

		ChangeRename
		{
			from:	"eq_intercepts"
			to:		"equalIntercept"
		}

		ChangeRename
		{
			from:	"eq_residuals"
			to:		"equalResidual"
		}

		ChangeRename
		{
			from:	"eq_residualcovariances"
			to:		"equalResidualCovariance"
		}

		ChangeRename
		{
			from:	"eq_means"
			to:		"equalMean"
		}

		ChangeRename
		{
			from:	"eq_thresholds"
			to:		"equalThreshold"
		}

		ChangeRename
		{
			from:	"eq_regressions"
			to:		"equalRegression"
		}

		ChangeRename
		{
			from:	"eq_variances"
			to:		"equalLatentVariance"
		}

		ChangeRename
		{
			from:	"eq_lvcovariances"
			to:		"equalLatentCovariance"
		}

		ChangeRename
		{
			from:	"group.partial"
			to:		"freeParameters"
		}
	}
}
