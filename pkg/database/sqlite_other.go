//go:build !zos

package database

import "github.com/uptrace/bun/driver/sqliteshim"

const sqliteDriverName = sqliteshim.ShimName
