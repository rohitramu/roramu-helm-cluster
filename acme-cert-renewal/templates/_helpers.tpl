{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "acme-cert-renewal.chartname" -}}
  {{- .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "acme-cert-renewal.chart" -}}
  {{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Resource labels.
*/}}
{{- define "acme-cert-renewal.labels" -}}
app.kubernetes.io/name: {{ include "acme-cert-renewal.chartname" . }}
helm.sh/chart: {{ include "acme-cert-renewal.chart" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
The service's label selector.
*/}}
{{- define "acme-cert-renewal.selectedLabels" -}}
app.kubernetes.io/name: {{ include "acme-cert-renewal.chartname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}