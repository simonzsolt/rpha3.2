# Install perl depenedencies

`cpan Biblio/Isis.pm JSON.pm Modern::Perl.pm Data::Dumper.pm`.

# Execute files

Execute `perl` files with `perl -CSAD` command from `scripts` folder.
Execute `js` files with `node`.

# Database location

http://magyar-irodalom.elte.hu/repertorium/cds_isis/ver_3_2.zip

By default extract to project root folder.

# Usage

- Use `convert_to_utf8_json.pl` file to create `repert_array.json` in `results` folder
- Use `replace_tags_utf8.pl` file to create `tag_names_utf8.json` in `results` folder.
- Use `toJsonFiles.js` to create separate `json` files in `results/json_files` folder. 


# Notes

- Note for R0693: the work of Claudius Aelianus: *Ailianou Poikiles Istorias*
  - 3.2 uses: *Poikilês*
  - OSZK version uses: *Poikhílł*
  - online usage: *Poikilēs* ([http://www.worldcat.org/oclc/7155614a87](http://www.worldcat.org/oclc/7155614a87))
- Note for R1076: *Nekrikoi dialogoi*
  - 3.2 uses: *Nekrikoï dialogoï*
  - OSZK version uses: *Nekriko dialogo*
  - online usage: *Νεκρικοί διάλογοι*
- Note for *Apor-kódex* description
  - OSZK version uses: Sfîntu-Gheorghe (Sepsiszentgyörgy)
  - online usage: Sfântu Gheorghe
- Note for *Teleki-kódex* description
  - OSZK version uses: Tîrgu Mureș (Marosvásárhely)
  - online usage: Târgu Mureș
