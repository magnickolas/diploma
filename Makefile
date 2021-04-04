TEX_SOURCE := diploma

BUILDPARAM = -e '$$max_repeat=4' -cd -f -pdf -interaction=nonstopmode -synctex=1 -latexoption=-shell-escape
WATCHPARAM = -pvc -f -pdf -interaction=nonstopmode -synctex=1 -latexoption=-shell-escape
TEMP_FILES = *.aux *.fdb_latexmk *.fls *.log *.out *.synctex.gz *.xdv *.bbl *.bcf *.blg *.run.xml *.toc

.PHONY: build
build:
	latexmk $(BUILDPARAM) $(TEX_SOURCE).tex

.PHONY: preview
preview: build
	evince $(TEX_SOURCE).pdf & disown

.PHONY: watch
watch:
	latexmk $(WATCHPARAM) $(TEX_SOURCE).tex

.PHONY: clean
clean:
	rm -rf $(TEMP_FILES)

.PHONY: purge
purge: clean
	rm -rf $(TEX_SOURCE).pdf

.PHONY: help
help:
	@printf "Usage: make [options] [target] ...\n"
	@printf "\n"
	@printf "Valid targets:\n"
	@printf "\n"
	@printf "    build              compile the tex-source (default parameter)\n"
	@printf "    watch              compile the tex-source continously\n"
	@printf "    help               display this help message\n"
	@printf "    clean              delete temporary files\n"
	@printf "    purge              delete temporary files and produced pdf\n"
