input = getDirectory("Input directory");
output = getDirectory("Output directory");

Dialog.create("File type");
Dialog.addString("File suffix: ", ".lsm", 5);
Dialog.show();
suffix = Dialog.getString();

processFolder(input);

function processFolder(input) {
	list = getFileList(input);
	for (i = 0; i < list.length; i++) {
		if (File.isDirectory("" + input + list[i]))
			processFolder("" + input + list[i]);
		if (endsWith(list[i], suffix))
			processFile(input, output, list[i]);
	}
}

function processFile(input, output, file) {
	open("" + input + file);
	run("Z Project...", "projection=[Max Intensity]");
	saveAs("Tiff", "" + output + file);
	close();
	close();

	print("Processing:" + input + file);
	print("Saving to:" + output);
}
