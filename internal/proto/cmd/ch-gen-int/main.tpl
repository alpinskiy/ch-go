{{- /*gotype: github.com/go-faster/ch/internal/proto/cmd/ch-gen-int.Variant*/ -}}
// Code generated by ./cmd/ch-gen-int, DO NOT EDIT.

package proto

import (
{{- if .Float }}
   "math"
{{- end }}
  "github.com/go-faster/errors"
)

// {{ .Type }} represents {{ .Name }} column.
type {{ .Type }} []{{ .ElemType }}

// Compile-time assertions for {{ .Type }}.
var (
  _ Input  = {{ .Type }}{}
  _ Result = (*{{ .Type }})(nil)
)

// Type returns ColumnType of {{ .Name }}.
func ({{ .Type }}) Type() ColumnType {
  return {{ .ColumnType }}
}

// Rows returns count of rows in column.
func (c {{ .Type }}) Rows() int {
  return len(c)
}

// Reset resets data in row, preserving capacity for efficiency.
func (c *{{ .Type }}) Reset() {
  *c = (*c)[:0]
}

// EncodeColumn encodes {{ .Name }} rows to *Buffer.
func (c {{ .Type }}) EncodeColumn(b *Buffer) {
  for _, v := range c {
    b.Put{{ .Name }}(v)
  }
}

// DecodeColumn decodes {{ .Name }} rows from *Reader.
func (c *{{ .Type }}) DecodeColumn(r *Reader, rows int) error {
  {{- if .SingleByte }}
  data, err := r.ReadRaw(rows)
  {{- else }}
  const size = {{ .Bits }} / 8
  data, err := r.ReadRaw(rows * size)
  {{- end }}
  if err != nil {
    return errors.Wrap(err, "read")
  }
  {{- if .Byte }}
  *c = append(*c, data...)
  {{- else if .SingleByte }}
  v := *c
  for i := range data {
    v = append(v, {{ .ElemType }}(data[i]))
  }
  *c = v
  {{- else }}
  v := *c
  for i := 0; i < len(data); i += size {
    v = append(v,
    {{- if .Float }}
      math.{{ .Name }}frombits(bin.{{ .BinFunc }}(data[i:i+size])),
    {{- else if .Signed }}
     {{ .ElemType }}(bin.{{ .BinFunc }}(data[i:i+size])),
    {{- else }}
      bin.{{ .BinFunc }}(data[i:i+size]),
    {{- end }}
    )
  }
  *c = v
  {{- end }}
  return nil
}
