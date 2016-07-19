/* Full IML use of R from SAS */
proc iml;

/* Send the SAS help data set iris to R as SASIris */
run ExportDataSetToR("Sashelp.iris", "SASIris" );
submit / R;
	library(mosaic)
	str(SASIris);
	model <- lm(SepalLength ~ SepalWidth + PetalLength, data=SASIris)
	summary(model)
	anova(model)
	SASIris.Diag <- fortify(model)
	SASIris.Diag %>% 
		ggplot(aes(x=SepalWidth,y=.resid)) +
		geom_point() +
		ggtitle("Residuals by Sepal Width")
	ggsave("w:\\IrisResid.png")
endsubmit;

/* Bring R results back to SAS */
run ImportDataSetFromR("Work.SASIrisDiag","SASIris.Diag");
use Work.SASIrisDiag;
show contents;
close Work.SASIrisDiag;
proc sgplot
    data=Work.SASIrisDiag
    description="Iris model from R - diagnostics";
    scatter 
        x = SepalWidth
        y = _resid;
run;
	

