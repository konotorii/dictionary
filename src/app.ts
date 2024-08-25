import express from 'express';
import morgan from 'morgan';
import helmet from 'helmet';

require('dotenv').config();

const app = express();

app.use(morgan('dev'));
app.use(helmet());
app.use(express.json());

app.get('/detect', async (req, res) => {

});

export default app;