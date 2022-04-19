// Code generated by ./cmd/ch-gen-int, DO NOT EDIT.

package proto

// ColDecimal32 represents Decimal32 column.
type ColDecimal32 []Decimal32

// Compile-time assertions for ColDecimal32.
var (
	_ ColInput  = ColDecimal32{}
	_ ColResult = (*ColDecimal32)(nil)
	_ Column    = (*ColDecimal32)(nil)
)

// Type returns ColumnType of Decimal32.
func (ColDecimal32) Type() ColumnType {
	return ColumnTypeDecimal32
}

// Rows returns count of rows in column.
func (c ColDecimal32) Rows() int {
	return len(c)
}

// Row returns i-th row of column.
func (c ColDecimal32) Row(i int) Decimal32 {
	return c[i]
}

// Append Decimal32 to column.
func (c *ColDecimal32) Append(v Decimal32) {
	*c = append(*c, v)
}

// AppendArr appends slice of Decimal32 to column.
func (c *ColDecimal32) AppendArr(v []Decimal32) {
	*c = append(*c, v...)
}

// Reset resets data in row, preserving capacity for efficiency.
func (c *ColDecimal32) Reset() {
	*c = (*c)[:0]
}

// LowCardinality returns LowCardinality for Decimal32 .
func (c *ColDecimal32) LowCardinality() *ColLowCardinalityOf[Decimal32] {
	return &ColLowCardinalityOf[Decimal32]{
		index: c,
	}
}

// Array is helper that creates Array of Decimal32.
func (c *ColDecimal32) Array() *ColArrOf[Decimal32] {
	return &ColArrOf[Decimal32]{
		Data: c,
	}
}

// NewArrDecimal32 returns new Array(Decimal32).
func NewArrDecimal32() *ColArr {
	return &ColArr{
		Data: new(ColDecimal32),
	}
}

// AppendDecimal32 appends slice of Decimal32 to Array(Decimal32).
func (c *ColArr) AppendDecimal32(data []Decimal32) {
	d := c.Data.(*ColDecimal32)
	*d = append(*d, data...)
	c.Offsets = append(c.Offsets, uint64(len(*d)))
}
