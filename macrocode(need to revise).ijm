
SourceDir = getDirectory("C:/Users/ek18186/OneDrive - University of Bristol/Desktop/3D printer/20190418");

TargetDir = getDirectory("C:/Users/ek18186/OneDrive - University of Bristol/Desktop/results/20190418");

list = getFileList(SourceDir);


for(i = 0; i < list.length; i++) 
{
	
list2 = getFileList(SourceDir+list[i]);
	
for(j = 0; j < list.length; j++) 
{
		
subdir = SourceDir + list[i] + list2[j];

		Myoperation(subdir);
		
close();
	
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

run("Color Threshold...");

run("8-bit");

setAutoThreshold("Default dark");

//run("Threshold...");
	
setThreshold(21, 255);
	
run("Analyze Particles...", "size=70-Infinity circularity=0.00-0.78 show=Outlines display clear stack");
	
saveAs(TargetDir+title, TargetDir+title+'.csv');

}