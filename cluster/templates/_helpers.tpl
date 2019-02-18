{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the app.
*/}}
{{- define "cluster.name" -}}
cluster
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "cluster.chart" -}}
  {{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create labels.
*/}}
{{- define "cluster.labels" -}}
app.kubernetes.io/name: {{ include "cluster.name" . }}
helm.sh/chart: {{ include "cluster.chart" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Create label selector.
*/}}
{{- define "cluster.selectedLabels" -}}
app.kubernetes.io/name: {{ include "cluster.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{/*
Create docker registry secret.  A context with the properties "registry", "username" and "password" must be provided.
*/}}
{{- define "cluster.containerRegistrySecret" -}}
{{- printf "{\"auths\": {\"%s\": {\"auth\": \"%s\"}}}" .registry (printf "%s:%s" .username .password | b64enc) | b64enc }}
{{- end }}
