-- ==========================================
-- Supabase 建表 SQL
-- 在 Supabase 控制台 → SQL Editor 中执行
-- ==========================================

CREATE TABLE IF NOT EXISTS daily_records (
    id          BIGSERIAL PRIMARY KEY,
    date        TEXT NOT NULL,
    words       TEXT NOT NULL,
    article     TEXT NOT NULL,
    created_at  TIMESTAMPTZ DEFAULT NOW()
);

-- 为 date 字段创建索引，加速按日期查询
CREATE INDEX IF NOT EXISTS idx_daily_records_date ON daily_records (date);

-- 启用 Row Level Security（推荐）
ALTER TABLE daily_records ENABLE ROW LEVEL SECURITY;

-- 允许所有操作（因为是单用户本地使用，简化策略）
-- 如果部署到公网，请替换为更严格的策略
CREATE POLICY "Allow all for single user"
ON daily_records
FOR ALL
USING (true)
WITH CHECK (true);
