import * as fs from 'fs';
import * as readline from 'readline';
import db from "./prisma";
import {formatNumber, Logger} from "useful-functions-ts";

const logger = new Logger('Ingest');

async function main() {
    const languages = [
        {
            value: 'de',
            file: 'de.dic'
        },
        {
            value: 'en',
            file: 'en.txt'
        }
    ];

    for (let language of languages) {
        const fileStream = fs.createReadStream('./models/' + language.file);

        const rl = readline.createInterface({
            input: fileStream,
            crlfDelay: Infinity
        });

        let dictionary = await db.dictionary.findFirst({
            where: {
                language: language.value
            }
        });

        if (!dictionary) dictionary = await db.dictionary.create({data: {language: language.value}});

        let index = 0

        for await (const line of rl) {
            const find = await db.word.findFirst({where: {value: line}});

            if (!find) await db.word.create({
                data: {
                    value: line,
                    description: "",
                    dictionary: {connect: {id: dictionary.id}}
                }
            });
            index++
            logger.info(`${language.value}: ${line} | ${formatNumber(index, 'en')}`);
        }
    }
}

main()