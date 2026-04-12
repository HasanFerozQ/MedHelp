import pdfplumber

def debug_pdf():
    pdf_path = "vision/CARC-RARC-Consolidated List-2-11-26_0.pdf"
    with pdfplumber.open(pdf_path) as pdf:
        c = 0
        print("--- EXTRACTED CODES DUMP ---")
        for page in pdf.pages:
            tables = page.extract_tables()
            for table in tables:
                for row in table:
                    if not row or len(row) < 2: continue
                    raw0 = str(row[0]).strip()
                    if raw0 and any(c.isalpha() for c in raw0) and raw0.upper() != 'CODE':
                        print(f"RAW ROW: {row[0]!r} | DESC: {str(row[1])[:30]!r}")
                        c += 1
                        if c > 50:
                            return

if __name__ == "__main__":
    debug_pdf()
