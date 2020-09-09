# mdbibexport

mdbibexport.pl extracts the cited references of a Pandoc markdown document and writes a bibtex database for this document. The keys are extracted from the markdown file and written into an auxiliary file, which is used by BibTool to find the references in the bibtex (.bib) data base and to write them into a new file.

**This is a small fork that removes the prompts for manual input of files and takes the arguments passed to the command. See below.**

## Requirements
BibTool <http://gerd-neugebauer.de/software/TeX/BibTool/en/>, Pandoc <http://www.pandoc.org/> and Perl <https://www.perl.org/> have to be installed on the system. Version 2.65 of BibTool, version 1.16.0.2 of Pandoc and version 5.25 of Perl have been tested with this script.

## Use
The Perl script is run from command line, in a non interactive way, so you add the files as arguments in the following way:  

```
$ perl mdbibexport.pl <path to markdown file> <path to bibtex file>
```

The cited references will be exported as ```<markdownd file>.bib```.

### Note for Calibre users

To avoid the issue of change of cases in references, important if you are using Calibre to generate your .bib file, add these lines in your ```~/.bibtoolrsc``` file:

```
preserve.key.case {on}
select.case.sensitive {on}
```

## License
General Public License (GPL), version 3.0 <https://www.gnu.org/licenses/gpl-3.0.html>.

## Release version
0.21

## Release date
2016/12/11.

## Author
Dr. Robert Winkler.


## Contributor
Albert Krewinkel.
Franco Augusto

## Contact
robert.winkler@bioprocess.org, robert.winkler@cinvestav.mx.
