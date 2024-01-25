# Celest + OpenAI Example

A Flutter project showing how to use Celest to connect to OpenAI. This project demonstrates:

1. How to build Celest Functions
2. How to manage environment variables with Celest Functions
3. How to use custom model types with Celest Functions
4. How to connect your Flutter app to your Celest backend
5. How to use your Celest backend to serve configuration such as "supported GPT models", so that you can dynamically update them without deploying another version of your app

## Getting Started

Clone or download this repo. Then, navigate to the example `openai` folder in your console, and run the following command:

```shell
$ flutter pub get
```

Download Celest from the [Celest download page](https://celest.dev/download), and run the installer to get the Celest CLI.

Open this folder (`examples/openai`) in your favorite IDE, navigate to the `celest/config` folder, and create a `.env` file. This will contain your OpenAI token. To learn more about obtaining an OpenAI token, follow this [guide](https://www.maisieai.com/help/how-to-get-an-openai-api-key-for-chatgpt). 

The `.env` file you created in the `config` folder should contain the following key-value pair:

```shell
OPEN_AI_TOKEN=<your-open-ai-token>
```

You are now ready to run your backend locally.

In your console, and run the following command to start the local Celest environment:

```shell
$ celest start
```

This command will keep running in your console to watch for changes to your Celest backend.

Now, run your Flutter app and enjoy experimenting with Celest!
