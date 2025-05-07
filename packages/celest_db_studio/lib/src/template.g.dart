// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template.dart';

// **************************************************************************
// StrEmbeddingGenerator
// **************************************************************************

const _$indexHtml = r'''
<!DOCTYPE >
<html>
  <head>
    <style>
      html,
      body {
        padding: 0;
        margin: 0;
        width: 100vw;
        height: 100vh;
      }

      iframe {
        width: 100vw;
        height: 100vh;
        overflow: hidden;
        border: 0;
      }
    </style>
    <title>{{ title }}</title>
    <link
      rel="icon"
      type="image/x-icon"
      href="https://studio.outerbase.com/favicon.ico"
    />
  </head>
  <body>
    <script>{{ script }}</script>
    <db-studio></db-studio>
  </body>
</html>

''';

const _$indexJs = r'''
/**
 * The DbStudioElement class is a custom HTML element that embeds the Outerbase Studio
 * iframe and handles communication with the Turso driver for executing SQL queries.
 */
class DbStudioElement extends HTMLElement {
  constructor() {
    super();
  }

  /**
   * The Outerbase Studio iframe.
   *
   * @type {HTMLIFrameElement}
   * @private
   */
  #iframe;

  /**
   * The message handler for the iframe.
   *
   * @type {function(MessageEvent): void}
   * @private
   */
  #handler;

  connectedCallback() {
    this.#iframe = document.createElement("iframe");
    this.#iframe.src = "https://studio.outerbase.com/embed/sqlite";
    this.appendChild(this.#iframe);

    this.#handler = this.#handleMessage.bind(this);
    window.addEventListener("message", this.#handler);
  }

  disconnectedCallback() {
    window.removeEventListener("message", this.#handler);
    this.#iframe.remove();
  }

  /**
   * Handles messages from the iframe.
   *
   * @param {MessageEvent} event
   */
  async #handleMessage(event) {
    const data = event.data;
    switch (data?.type) {
      case "transaction":
      case "query":
        console.debug(`Executing ${data.type}:`, data);
        const result = await this.#executeQuery(data);
        this.#iframe.contentWindow?.postMessage(result, "*");
        break;
    }
  }

  /**
   * Executes a SQL request and returns the result.
   *
   * @typedef {{type: 'query', id: number, statement: string}} QueryRequest
   * @typedef {{type: 'transaction', id: number, statements: string[]}} TransactionRequest
   *
   * @param {QueryRequest | TransactionRequest} request
   */
  async #executeQuery(request) {
    const response = await fetch("./query", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(request),
    });
    if (response.ok) {
      const result = await response.json();
      console.debug("Query result:", result);
      return result;
    } else {
      const error = await response.text();
      console.error("Error executing query:", error);
      return { type: request.type, id: request.id, error };
    }
  }
}

customElements.define("db-studio", DbStudioElement);

''';
