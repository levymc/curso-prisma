/*
  Warnings:

  - You are about to drop the `favorites` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE "favorites";

-- CreateTable
CREATE TABLE "user" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "profileId" INTEGER NOT NULL,

    CONSTRAINT "user_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "profile" (
    "id" SERIAL NOT NULL,
    "firstName" TEXT NOT NULL,
    "lastName" TEXT NOT NULL,
    "userId" INTEGER NOT NULL,

    CONSTRAINT "profile_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "address" (
    "id" SERIAL NOT NULL,
    "street" TEXT NOT NULL,
    "number" INTEGER NOT NULL,
    "zipcode" INTEGER NOT NULL,
    "profileId" INTEGER NOT NULL,

    CONSTRAINT "address_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "profileService" (
    "id" SERIAL NOT NULL,
    "servicecode" INTEGER NOT NULL,
    "profile_id" INTEGER NOT NULL,

    CONSTRAINT "profileService_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Service" (
    "id" SERIAL NOT NULL,
    "description" TEXT NOT NULL,

    CONSTRAINT "Service_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_profile_services" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "user_email_key" ON "user"("email");

-- CreateIndex
CREATE UNIQUE INDEX "user_profileId_key" ON "user"("profileId");

-- CreateIndex
CREATE UNIQUE INDEX "profile_userId_key" ON "profile"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "address_zipcode_key" ON "address"("zipcode");

-- CreateIndex
CREATE UNIQUE INDEX "address_profileId_key" ON "address"("profileId");

-- CreateIndex
CREATE UNIQUE INDEX "profileService_servicecode_key" ON "profileService"("servicecode");

-- CreateIndex
CREATE UNIQUE INDEX "_profile_services_AB_unique" ON "_profile_services"("A", "B");

-- CreateIndex
CREATE INDEX "_profile_services_B_index" ON "_profile_services"("B");

-- AddForeignKey
ALTER TABLE "profile" ADD CONSTRAINT "profile_userId_fkey" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "address" ADD CONSTRAINT "address_profileId_fkey" FOREIGN KEY ("profileId") REFERENCES "profile"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "profileService" ADD CONSTRAINT "profileService_servicecode_fkey" FOREIGN KEY ("servicecode") REFERENCES "Service"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_profile_services" ADD CONSTRAINT "_profile_services_A_fkey" FOREIGN KEY ("A") REFERENCES "profile"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_profile_services" ADD CONSTRAINT "_profile_services_B_fkey" FOREIGN KEY ("B") REFERENCES "profileService"("id") ON DELETE CASCADE ON UPDATE CASCADE;
