# Lichen

## Coding Structure

- Leeres Node von dem verwendeten Typen als Root jeder Scene
- Sinnvolle Namen, die beschreiben um was es sich handelt
    - counter in loops können aber auch nur ein Buchstabe sein


## LFS

### Git LFS

Alles was nicht reiner Text ist in die `.gitattributes`-Datei
hinzufügen: `<extension>` durch die Fileextension ersetzen. Muss nur
einmal pro Dateityp gemacht werden.
```bash
*.<extension> filter=lfs diff=lfs merge=lfs -text
```
