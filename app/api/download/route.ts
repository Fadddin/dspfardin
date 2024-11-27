import path from "path";
import fs from "fs";

export async function GET() {
    const filePath = path.resolve("./public/OddEven.m");

    if (!fs.existsSync(filePath)) {
        return new Response("File not found", {
            status: 404,
            headers: {
                "Access-Control-Allow-Origin": "*", // Allow all origins
                "Access-Control-Allow-Methods": "GET, OPTIONS",
            },
        });
    }

    const fileBuffer = fs.readFileSync(filePath);
    return new Response(fileBuffer, {
        headers: {
            "Content-Type": "text/plain",
            "Content-Disposition": "attachment; filename=OddEven.m",
            "Access-Control-Allow-Origin": "*", // Allow all origins
            "Access-Control-Allow-Methods": "GET, OPTIONS",
        },
    });
}
