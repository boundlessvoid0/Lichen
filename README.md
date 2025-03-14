# Lichen

## LFS

### Git LFS

Alles was nicht reiner Text in die `.gitattributes`-Datei hinzufügen:
`<extension>` durch die Fileextension ersetzen. Muss nur
einmal pro Dateityp gemacht werden.
%% Code %%
```bash
*.<extension> filter=lfs diff=lfs merge=lfs -text
```
%% Code %%
