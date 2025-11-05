
# fix some docker permissions
WD := $(shell pwd)
UID := $(shell id -u)
GID := $(shell id -g)

lualatex:
	docker run -i --rm --name latex \
		-u $(UID):$(GID) \
		-v "$(WD)":/usr/src/app \
		-e TEXINPUTS=.:./vakthesis//: \
		-w /usr/src/app \
		phd-thesis-texlive-image2 \
		lualatex phd_thesis.tex

biber:
	docker run -i --rm --name latex \
		-u $(UID):$(GID) \
		-v "$(WD)":/usr/src/app \
		-e TEXINPUTS=.:./vakthesis//: \
		-w /usr/src/app \
		phd-thesis-texlive-image2 \
		biber phd_thesis


clean:
	rm -f *.aux
	rm -f *.log 
	rm -f *.blg 
	rm -f *.toc
	rm -f *.fdb_latexmk
	rm -f *.fls
	rm -f *.run.xml
	rm -f *.bcf
	rm -f *.bbl
	rm -f *.out
	rm -f pdfa.xmpi
