encrypt file *args:
  just install-pre-commit && sops --encrypt --in-place {{ file }} {{ args }}

decrypt file *args:
  just install-pre-commit && sops --decrypt --in-place {{ file }} {{ args }}

e file *args:
  just encrypt {{ file }} {{ args }}

d file *args:
  just decrypt {{ file }} {{ args }}

appe app env:
  just basee {{ app }} {{ env }}

appd app env:
  just based {{ app }} {{ env }}

basee app env:
  just encrypt base/{{ env }}/{{ app }}/secrets.yaml

based app env:
  just decrypt base/{{ env }}/{{ app }}/secrets.yaml

reconcile *args:
  flux reconcile ks flux-system --with-source {{ args }}

install-pre-commit:
  cp pre-commit .git/hooks/pre-commit && chmod +x .git/hooks/pre-commit

install-pre-push:
  cp pre-commit .git/hooks/pre-push && chmod +x .git/hooks/pre-push

watch:
  watch "git log -1 && echo '---' && kubectl get pods -A && echo '---' && flux get kustomizations"
