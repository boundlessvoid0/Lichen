# Lichen

## LFS

### Git LFS

Alles was nicht reiner Text in die `.gitattributes`-Datei hinzufügen:
`<extension>` durch die Fileextension ersetzen. Muss nur
einmal pro Dateityp gemacht werden.
```bash
*.<extension> filter=lfs diff=lfs merge=lfs -text
```
