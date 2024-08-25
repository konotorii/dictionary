/*
  Warnings:

  - A unique constraint covering the columns `[value]` on the table `word` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "word_value_key" ON "word"("value");
