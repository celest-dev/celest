# Celest OpenAI project

A Flutter project showing examples of connecting to openAI. This project demonstrates:

1. How to build Functions.
2. Using custom model types with Celest functions.
3. Connecting your Flutter app to your Celest backend.
4. Using the Celest backend to pass configurable values such as "AI model types", so that you can update them without deploying another version of your app.


## Getting Started

Clone or download this repo. Then, Navigate to the example `openai` in your console, and run the following command:

```shell
$ flutter pub get
```

Download celest from the [Celest download page](https://celest.dev/download). Then, run the installer and follow the prompts.

Open the `openai` folder in your favorite IDE, and navigate to the `celest/config` folder and create a `.env` file. This will contain your open AI key. To learn more about obtaining an open AI key you can follow this [guide](https://www.maisieai.com/help/how-to-get-an-openai-api-key-for-chatgpt). 

The `.env` file you create in the `config` folder should contain the following parameter:

```shell
OPEN_AI_KEY=<Your_open_AI_key_value>
```

You are now ready to run your backend locally.

Navigate in your console to the `openai/celest` folder in your console, and run the following command to install the needed dependencies:

```shell
$ celest start
```

This command will keep running in your console and watch for changes.

Now, run your Flutter app and enjoy experimenting with Celest!
