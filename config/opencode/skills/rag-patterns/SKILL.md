---
name: rag-patterns
description: Use when building Retrieval-Augmented Generation systems with document chunking, embeddings, and vector search.
---

# RAG Patterns

## When to Use This Skill
- Building a question-answering system over private documents
- Implementing semantic search with embedding-based retrieval
- Choosing chunking strategies for document ingestion
- Optimizing retrieval quality with reranking

## Workflow
1. Ingest documents and split into chunks using an appropriate strategy (fixed-size, semantic, recursive)
2. Generate embeddings for each chunk using a sentence transformer or OpenAI embedding model
3. Store embeddings in a vector database (Pinecone, Weaviate, Qdrant, pgvector)
4. On query: generate an embedding for the search term, retrieve top-k similar chunks
5. Optionally rerank retrieved chunks with a cross-encoder model
6. Construct the prompt: inject retrieved context into the LLM prompt
7. Generate the answer and return it with source citations
8. Evaluate retrieval quality with metrics: recall@k, MRR, or human judgment

## Rules
- Chunk size should match the embedding model's context window
- Overlap chunks by 10-20% to avoid splitting mid-sentence
- Use hybrid search (keyword + semantic) for better recall
- Always cite sources — don't present retrieved text as model knowledge
- Test with adversarial queries that might retrieve irrelevant chunks
- Monitor embedding costs — they scale with document count
