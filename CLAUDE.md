# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a LaTeX-based memoir (French academic report) documenting an alternance experience at Enedis. The project focuses on transforming a regional HR tool into a national application using Angular/NestJS/Prisma stack.

## Common Commands

### Building the PDF
```bash
make all
```
This uses Docker with TexLive to compile the LaTeX document and generate the PDF in the `output/` directory.

### Development with Live Reload
```bash
make watch
```
Continuously watches for changes and rebuilds the PDF automatically using `latexmk -pvc`.

### Cleaning Output
```bash
make clean
```
Removes the entire `output/` directory and all generated files.

## Project Structure

- `src/main.tex` - Main LaTeX document that includes all chapters
- `src/chapters/` - Individual chapter files:
  - `introduction.tex` - Context and problem statement
  - `entreprise.tex` - Company presentation (Enedis)
  - `synthese.tex` - Work synthesis
  - `problematique.tex` - Problem analysis
  - `rex.tex` - Experience feedback
  - `conclusion.tex` - Conclusion
- `src/annexes/` - Appendices (glossary, screenshots)
- `src/images/` - Logo and image assets
- `src/styles/` - LaTeX styling and custom commands
- `src/title.tex` - Title page
- `src/main.bib` - Bibliography references
- `structure.md` - Document structure outline in French
- `output/` - Generated PDF and compilation artifacts

## LaTeX Configuration

The document uses:
- 12pt font with two-sided layout
- French babel for language support
- Custom headers/footers with fancy styling
- Bibliography with biblatex
- Custom spacing and formatting for academic report style

## Content Guidelines

This is an academic memoir about:
- Transforming an Excel-based HR tool into a national web application
- Project management and development at Enedis
- Technical stack: Angular, NestJS, Prisma
- Challenges of scaling from regional to national deployment
- GDPR compliance and security constraints in public sector

## Docker Environment

The build process uses the official TexLive Docker image (`registry.gitlab.com/islandoftex/images/texlive:latest`) to ensure consistent compilation across different systems.