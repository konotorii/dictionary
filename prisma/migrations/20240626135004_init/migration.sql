-- CreateTable
CREATE TABLE "dictionary" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "language" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- CreateTable
CREATE TABLE "word" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "dictionaryId" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "value" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "word_dictionaryId_fkey" FOREIGN KEY ("dictionaryId") REFERENCES "dictionary" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "dictionary_id_key" ON "dictionary"("id");

-- CreateIndex
CREATE UNIQUE INDEX "word_id_key" ON "word"("id");
