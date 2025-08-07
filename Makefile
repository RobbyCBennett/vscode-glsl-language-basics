OUTPUT := glsl.vsix
WATCH  := .vscodeignore CHANGELOG.md LICENSE.md grammar.json language-configuration.json package.json

$(OUTPUT): $(WATCH) | node_modules
	node node_modules/@vscode/vsce/vsce package -o $(OUTPUT)

node_modules:
	npm i

install: $(OUTPUT)
	code --install-extension $(OUTPUT)
