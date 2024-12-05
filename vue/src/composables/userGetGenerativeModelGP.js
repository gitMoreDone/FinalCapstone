import {useGenAi} from './useGenAi.js'

export const useGetGenerativeModelGP = async (prompt) => {

    const model = await useGenAi('gemini-pro');
    const result = await model.generateContent(prompt);
    const response = await result.response;
    const text = response.text();
    const formatText = text.replace(/\*\*(.*?)\*\*/g, '$1').replace(/(?<!\*)\*(?!\*)/g, '\n');
    console.log(formatText)

    return formatText;
}