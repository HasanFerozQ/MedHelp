import pdfplumber

def debug_pdf():
    pdf_path = "vision/CARC-RARC-Consolidated List-2-11-26_0.pdf"
    with pdfplumber.open(pdf_path) as pdf:
        c = 0
        print("--- EXTRACTED CODES DUMP ---")
        for i, page in enumerate(pdf.pages):
            if i < 4: continue # Skip to page 5
            tables = page.extract_tables()
            for table in tables:
                for row in table:
                    if not row or len(row) < 2: continue
                    print(f"RAW ROW: {row[0]!r} | {row[1]!r} | {str(row[2])[:20] if len(row)>2 else ''}")
                    c += 1
                    if c > 20:
                        return

if __name__ == "__main__":
    debug_pdf()
