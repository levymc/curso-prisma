import prisma from "../src/database"

async function checkOrCreateDefaultCustomer(){
    return await prisma.customer.upsert({
        create: {
            firstName: 'Geraldo Luiz',
            lastName: 'Datena',
            document: '13324549760',
        },
        update: {},
        where: {
            document: '13324549760'
        }
    })

}

async function main() {
    return checkOrCreateDefaultCustomer()
}

main().then(async () => {
    await prisma.$disconnect()
}).catch(async (e) => {
    console.error(e)
    await prisma.$disconnect()
})