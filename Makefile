.PHONY: pdf

all: pdf with_notes notes_only notes_only_print handouts handouts_print handouts_space
# all: pdf with_notes handouts handouts_print handouts_space clean

pdf: 20200602_theory_club.tex
	latexmk -pdf -pdflatex="pdflatex -interactive=nonstopmode" -use-make 20200602_theory_club_presentation.tex

with_notes: 20200602_theory_club_presentation_notes.tex
	latexmk -pdf -pdflatex="pdflatex -interactive=nonstopmode" -use-make 20200602_theory_club_presentation_notes.tex

notes_only: 20200602_theory_club_notes_only.tex
	latexmk -pdf -pdflatex="pdflatex -interactive=nonstopmode" -use-make -bibtex- 20200602_theory_club_notes_only.tex

notes_only_print: notes_only 20200602_theory_club_notes_only_print.tex
	latexmk -pdf -pdflatex="pdflatex -interactive=nonstopmode" -use-make -bibtex- 20200602_theory_club_notes_only_print.tex

handouts: 20200602_theory_club_handouts.tex
	latexmk -pdf -pdflatex="pdflatex -interactive=nonstopmode" -use-make 20200602_theory_club_handouts.tex

handouts_print: handouts 20200602_theory_club_handouts_print.tex
	latexmk -pdf -pdflatex="pdflatex -interactive=nonstopmode" -use-make 20200602_theory_club_handouts_print.tex

handouts_space: 20200602_theory_club_handouts_with_space.tex
	latexmk -pdf -pdflatex="pdflatex -interactive=nonstopmode" -use-make 20200602_theory_club_handouts_with_space.tex

clean:
	rm -fv *.aux *.bbl *.blg *.log *.nav *.out *.snm *.toc *.dvi *.vrb *.bcf *.run.xml *.cut *.lo*
	latexmk -c
