# 天神传 MUD 游戏 - Makefile（g++ / MinGW / Linux / macOS）
#
# 用法：
#   make         编译生成可执行文件 game
#   make clean   清理编译产物
#   make rebuild 重新编译

CXX      = g++
CXXFLAGS = -std=c++17 -Wall -Wextra -g

# 源码按功能分在 src/ 下的子模块目录中
SRCDIRS  = src/core src/ui src/character src/combat src/items src/world src/quest src/system
INCLUDES = -Isrc $(foreach d,$(SRCDIRS),-I$(d))

TARGET   = game
SOURCES  = $(foreach d,$(SRCDIRS),$(wildcard $(d)/*.cpp))
OBJECTS  = $(SOURCES:.cpp=.o)

all: $(TARGET)

$(TARGET): $(OBJECTS)
	$(CXX) $(OBJECTS) -o $(TARGET)

%.o: %.cpp
	$(CXX) $(CXXFLAGS) $(INCLUDES) -c $< -o $@

clean:
	rm -f $(OBJECTS) $(TARGET)

rebuild: clean all

.PHONY: all clean rebuild
