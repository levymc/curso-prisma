import prisma from "./database";

(async () => {
  try {
    const studentsWithoutJobByClass = await prisma.student.groupBy({
      by: ["class"],
      where: {
        jobId: {
          equals: null,
        },
      },
      _count: {
        _all: true,
      },
      orderBy: {
        _count: {
          _all: true,
        },
      },
    });

    console.log("Agrupamento de alunos por turma que ainda não tem trabalho (quantos alunos em cada turma ainda não se empregaram?):");
    console.log(studentsWithoutJobByClass);
  } catch (error) {
    console.error("Erro ao realizar a consulta de agrupamento de alunos por turma sem trabalho:", error);
  } finally {
    await prisma.$disconnect();
  }
})();
