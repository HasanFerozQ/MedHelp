-- Speed Fix: Indexing for fast topic and content loading
-- Resolves "Forever Loading" / Statement Timeout issues

CREATE INDEX IF NOT EXISTS idx_mcqs_topic_id ON mcqs(topic_id);
CREATE INDEX IF NOT EXISTS idx_case_studies_topic_id ON case_studies(topic_id);
CREATE INDEX IF NOT EXISTS idx_topics_year_id ON topics(year_id);

-- Ensure flashcards are indexed for fast retrieval
DO $$ 
BEGIN
    IF EXISTS (SELECT FROM pg_tables WHERE tablename = 'flashcards') THEN
        CREATE INDEX IF NOT EXISTS idx_flashcards_topic_id ON flashcards(topic_id);
    END IF;
END $$;
