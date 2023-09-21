import prisma from "./database";

(async () => {
  try {
    const studentsByClass = await prisma.student.groupBy({
      by: ["class"],
      _count: {
        id: true,
      },
      orderBy: {
        _count: {
          id: "desc",
        },
      },
    });

    console.log("agrupamento de alunos por turma:")
  } catch (error) {
    console.error(error)
  }
})();
