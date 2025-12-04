function onOpen() {
  DocumentApp.getUi()
    .createMenu('Math Utils')
    .addItem('Normalize $$ blocks', 'replaceEnterWithShiftEnterInsideMathBlocks')
    .addToUi();
}

function replaceEnterWithShiftEnterInsideMathBlocks() {
  const body = DocumentApp.getActiveDocument().getBody();
  const numChildren = body.getNumChildren();

  // 1) Find all well-formed $$ ... $$ blocks (each $$ on its own line)
  const blocks = [];
  let currentStart = -1;

  for (let idx = 0; idx < numChildren; idx++) {
    const el = body.getChild(idx);
    if (el.getType() !== DocumentApp.ElementType.PARAGRAPH) continue;

    const para = el.asParagraph();
    const text = para.getText().trim();

    if (text === '$$') {
      if (currentStart === -1) {
        // Open a new block
        currentStart = idx;
      } else {
        // Close the current block
        blocks.push({ start: currentStart, end: idx });
        currentStart = -1;
      }
    }
  }

  // If there's an unmatched opening $$ at the end, we ignore it.

  if (blocks.length === 0) {
    return; // Nothing to do
  }

  // 2) Process blocks from bottom to top, so indices stay valid after removals
  for (let b = blocks.length - 1; b >= 0; b--) {
    const { start, end } = blocks[b];

    // Safety: if indices are out of range, skip
    if (start < 0 || end >= body.getNumChildren() || start >= end) continue;

    const startPara = body.getChild(start).asParagraph();
    const startText = startPara.editAsText();

    // Merge all paragraphs between start and end INTO the start paragraph.
    // We repeatedly merge the paragraph at (start + 1) because after each removal,
    // the next one shifts into that position.
    for (let idx = start + 1; idx <= end; idx++) {
      const mergeIdx = start + 1;
      const el = body.getChild(mergeIdx);
      if (el.getType() !== DocumentApp.ElementType.PARAGRAPH) {
        body.removeChild(el);
        continue;
      }
      const p = el.asParagraph();
      const t = p.getText();
      startText.appendText('\n' + t);
      body.removeChild(p);
    }

    // 3) Cleanup: remove any whitespace right after certain \begin{...}
    const textObj = startPara.editAsText();
    const full = textObj.getText();

    const cleaned = full
      .replace(/(\\begin\{cases\})\s+/g, '$1 ')
      .replace(/(\\begin\{bmatrix\})\s+/g, '$1 ')
      .replace(/(\\begin\{split\})\s+/g, '$1 ');

    if (cleaned !== full) {
      textObj.setText(cleaned);
    }
  }
}
