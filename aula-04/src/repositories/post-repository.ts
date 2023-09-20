import { Post } from "@prisma/client";
import db from "../database/database";
import prisma from "../database/database";

export type CreatePost = Omit<Post, "id">

async function getPosts() {
  const posts = await prisma.post.findMany();
  return posts;
}

async function getPost(id: number) {
  const post = await prisma.post.findUnique({
    where: {
      id
    }
  })
  return post;
}

async function createPost(post: CreatePost) {
  const { username, title, content } = post;
  const createdPost = await prisma.post.create({
    data: post
  });
  return createdPost;
}

async function deletePost(id: number) {
  const deletedPost = await prisma.post.delete({
    where: {
      id
    }
  })
  return deletedPost;
}

const postRepository = {
  getPost,
  getPosts,
  createPost,
  deletePost
}

export default postRepository;