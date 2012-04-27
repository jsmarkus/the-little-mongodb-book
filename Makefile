PDF_GENERATOR = pandoc
PDF_GENERATOR_FLAGS = \
	--latex-engine xelatex \
	--template common/pdf/template.tex

PDF_NAME = mongodb.pdf


all:
	@echo "Usage: make [targets]"
	@echo "Targets"
	@echo " pdf-ru   russian PDF"
	@echo " pdf-en   english PDF"
	@echo " clean    clean project directory"

pdf-ru:
	$(PDF_GENERATOR) $(PDF_GENERATOR_FLAGS) ru/mongodb.markdown -o $(PDF_NAME)

pdf-en:
	$(PDF_GENERATOR) $(PDF_GENERATOR_FLAGS) en/mongodb.markdown -o $(PDF_NAME)

clean:
	@rm ${PDF_NAME}
