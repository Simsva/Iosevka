include config.mk

FONTS = $(shell find dist/iosevka-simsva/ttf -type f -iname "*.[to]tf" -printf '"%p"\n')
OUTFONTS = $(shell find dist/iosevka-simsva-nerd -type f -iname "*.[to]tf" -printf '"%p"\n')
OUTDIR = "$(PWD)/dist/out"

all: options iosevka nerd

options:
	@echo "nerd font options:"
	@echo "${NERDFLAGS}"

iosevka:
	npm install
	npm run build -- ttf::iosevka-simsva
	# Redefine FONTS after build
	$(eval FONTS := $(shell find dist/iosevka-simsva/ttf -type f -iname "*.[to]tf" -printf '"%p"\n'))

$(FONTS):
	./font-patcher --glyphdir="./nerd-fonts-src/glyphs/" --outputdir="./dist/iosevka-simsva-nerd/" ${NERDFLAGS} "$@"

nerd: $(FONTS)
	# Redefine OUTFONTS after patch
	$(eval OUTFONTS := $(shell find dist/iosevka-simsva-nerd -type f -iname "*.[to]tf" -printf '"%p"\n'))

clean:
	rm -rf "./dist/iosevka-simsva" "./dist/iosevka-simsva-nerd"

install:
	mkdir -p "${FONTPATH}/iosevka-simsva"
	cp -f $(OUTFONTS) "${FONTPATH}/iosevka-simsva"

# Rebuilding everything for every install is annoying
install_all: all install

dist:
	mkdir -p ${OUTDIR}
	tar -czf "${OUTDIR}/iosevka-simsva-nohint.tar.gz" -C "${OUTDIR}/../iosevka-simsva/ttf-unhinted/" .
	tar -czf "${OUTDIR}/iosevka-simsva.tar.gz" -C "${OUTDIR}/../iosevka-simsva/ttf/" .
	tar -czf "${OUTDIR}/iosevka-simsva-nerd.tar.gz" -C "${OUTDIR}/../iosevka-simsva-nerd/" .

uninstall:
	rm -rf "${FONTPATH}/iosevka-simsva"

.PHONY: all options iosevka $(FONTS) nerd clean install dist uninstall
