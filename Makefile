SRC_DIR := src
BIN_DIR := bin
EXC_FILE := Main_Example_1.exe

$(BIN_DIR)/$(EXC_FILE): $(SRC_DIR)/Main_Example_1.cs $(SRC_DIR)/StbImage.cs $(BIN_DIR)/libStbImageCSharp.so
	csc -out:$(BIN_DIR)/Main_Example_1.exe $(SRC_DIR)/Main_Example_1.cs $(SRC_DIR)/StbImage.cs
	chmod 777 $(BIN_DIR)/Main_Example_1.exe

$(BIN_DIR)/libStbImageCSharp.so:
	g++ -o $(BIN_DIR)/libStbImageCSharp.so -fPIC -shared -O3 $(SRC_DIR)/StbImageCSharp.cpp

run:
	./$(BIN_DIR)/$(EXC_FILE)

clean:
	rm -rf ./$(BIN_DIR)/*.*
