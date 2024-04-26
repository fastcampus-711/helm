{{- define "springboot-docker.labels" -}}
helm.sh/chart: {{ include "springboot-docker.chart" . }}
{{ include "springboot-docker.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "springboot-docker.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "springboot-docker.selectorLabels" -}}
app.kubernetes.io/name: {{ include "springboot-docker.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}