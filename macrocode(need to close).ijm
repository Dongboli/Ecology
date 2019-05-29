SourceDir = getDirectory("C:/Users/ek18186/OneDrive - University of Bristol/Desktop/3D printer/");
TargetDir = getDirectory("C:/Users/ek18186/OneDrive - University of Bristol/Desktop/results/");
list = getFileList(SourceDir);
for(i = 0; i< 17; i++) 
{
	list2 = getFileList(SourceDir+list[i]);
	for(j = 0; j < 4; j++) 
	{
	list3 = getFileList(SourceDir+list[i]+list2[j]);
		for(k =1; k< list.length; k++)
		{
		subdir = SourceDir + list[i] + list2[j] + list3[k];
		Myoperation(subdir);
		close();
		}
	}
}

function Myoperation(subdir)
 {
	run("Image Sequence...", "open=subdir sort");
	title = getTitle();
run("8-bit");
	run("Z Project...", "projection=[Average Intensity]");
imageCalculator("Subtract create stack", title,"AVG_"+title);
selectWindow("Result of "+title);
run("8-bit");
setAutoThreshold("Default dark");
//run("Threshold...");
	setThreshold(21, 255);
	run("Analyze Particles...", "size=70-Infinity circularity=0.00-0.78 show=Outlines summarize stack");
selectWindow("Summary of Result of "+title);
saveAs("Results", TargetDir+title+'.csv');
close();
close();
close();

}
