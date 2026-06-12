@echo off
set FILENAME=%~1
set FILENAME_NOEXT=%~n1

:: 1. LaTeX Durchlauf
pdflatex -interaction=nonstopmode -output-directory=build "%FILENAME%"

:: 2. BibTeX Durchlauf (schaut in den build-Ordner)
bibtex "build/%FILENAME_NOEXT%"

:: 3. Weitere LaTeX Durchläufe für Referenzen
pdflatex -interaction=nonstopmode -output-directory=build "%FILENAME%"
pdflatex -interaction=nonstopmode -output-directory=build "%FILENAME%"

:: 4. PDF zurückkopieren
copy /y "build\%FILENAME_NOEXT%.pdf" "%FILENAME_NOEXT%.pdf"